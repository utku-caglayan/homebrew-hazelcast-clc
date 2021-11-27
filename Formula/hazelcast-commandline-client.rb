class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/main"
  url "https://github.com/utku-caglayan/hazelcast-commandline-client/archive/refs/tags/v1.0.0-interactive-test.2.tar.gz"
  sha256 "258ab61febac914429cad3f0b00f692228ec95543d5fafe43c9002094be60f66"
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
