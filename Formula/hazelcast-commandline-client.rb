class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/main"
  url "https://github.com/hazelcast/hazelcast-commandline-client/archive/refs/tags/v1.0.0-test.6.tar.gz"
  sha256 "4c3a6ce10516ccc4eaa1ccc13c5ca28da73905ac0f32750ee6a9de43ac9bdcd8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/utku-caglayan/homebrew-hazelcast-clc/releases/download/hazelcast-commandline-client-6"
    sha256 cellar: :any_skip_relocation, catalina:     "f19060011d6a88022e1681f5ed3c721d8081e88c518de9dd1cfeea3d178076ee"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2daeb8b875df2ff83cbafa2eb8b34ee929b93b9d30e10cc343a85931292e24bd"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "true"
  end
end
