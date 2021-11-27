class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/interactive-clc"
  url "https://github.com/utku-caglayan/hazelcast-commandline-client/archive/refs/tags/v1.0.0-interactive-test.2.tar.gz"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, catalina:     "17ec242c6fa88a16566ec55454901c94b5adaa9dbbcd09dbc0a3d15875fc6db7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8bc8809005a75e7afd748a99522c7ae275595bd643c7119a412bc4046c593a72"
  end

  depends_on "go" => :build

  def install
    system "make"
    bin.install "hzc"
    bash_completion.install "extras/bash_completion.sh"
    zsh_completion.install "extras/zsh_completion.zsh" => "_hzc"
    # cp "#{bash_completion}/bash_completion.bash", zsh_completion
  end

  def post_install
    opoo "See https://docs.brew.sh/Shell-Completion to enable autocompletion"
    ohai "Example usages:
* `hzc map --name my-map put --key hello --value world` - put entry into map
* `hzc --help` - print help"
  end

  test do
    system "true"
  end
end
