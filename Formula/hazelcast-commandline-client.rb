class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/main"
  url "https://github.com/hazelcast/hazelcast-commandline-client/archive/refs/tags/v1.0.0-test.6.tar.gz"
  sha256 "4c3a6ce10516ccc4eaa1ccc13c5ca28da73905ac0f32750ee6a9de43ac9bdcd8"
  license "Apache-2.0"

  depends_on "go" => :build

  bottle do
    sha256 arm64_monterey: "01e1dc0704d6606839599ef423d34767997725d8e25110ce848e20434681efc5"
    sha256 arm64_big_sur:  "1adc0340427aeef3afbb0980b6fcea4edcfa6127ea44846615065b68a27544a8"
    sha256 monterey:       "ac8dd353f5d735a7c67317d612bdf77112b596b541248472f39cd907cb3eb2f0"
    sha256 big_sur:        "6635c9eac78d922dab5d49229ac667147d8b38e3535142afe647647dedcee260"
    sha256 catalina:       "b7bab47a69503d9f6a949c7b27db4e4545d2902b0ca7a5a4fd02071b7ad2cb9b"
    sha256 mojave:         "7d17fffd0920dbfdd79c68c38f375fae4da7dbaf4965f8d6a2876bbb9bc87e84"
    sha256 x86_64_linux:   "a964c718912feab17767ba90a09d15d12c2bb3240709cf70b751f413f2d72d87"
  end

  def install
    system "go", "build", "-o", "hzc", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "true"
  end
end
