class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/main"
  url "https://github.com/hazelcast/hazelcast-commandline-client/archive/refs/tags/v1.0.0-test.6.tar.gz"
  sha256 "4c3a6ce10516ccc4eaa1ccc13c5ca28da73905ac0f32750ee6a9de43ac9bdcd8"
  license "Apache-2.0"

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
