class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/interactive-clc"
  url "https://github.com/utku-caglayan/hazelcast-commandline-client/archive/refs/tags/v1.0.0-interactive-test.2.tar.gz"
  sha256 "a05ec92566fc352dfdeefd2b7ab535beb5ccc59bfde1f45c279353e24a8ae755"
  license "Apache-2.0"

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
