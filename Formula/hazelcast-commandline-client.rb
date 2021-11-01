class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/main"
  url "https://github.com/hazelcast/hazelcast-commandline-client/archive/refs/tags/v1.0.0-test.6.tar.gz"
  sha256 "4c3a6ce10516ccc4eaa1ccc13c5ca28da73905ac0f32750ee6a9de43ac9bdcd8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/utku-caglayan/homebrew-hazelcast-clc/releases/download/hazelcast-commandline-client-6"
    rebuild 1
    sha256 cellar: :any_skip_relocation, catalina:     "bc57a12cc0e472c7f139b1b5bbb5ecf5a865f4be46a6799ecc9a92bbd279e4cc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c59a6b6c56257f2d69ef9fc2815b04b1ef8e3534bd00a728effe88547034263f"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "hzc", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "true"
  end

  test do
    system "true"
  end
end
