class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/main"
  url "https://github.com/utku-caglayan/hazelcast-commandline-client/archive/refs/tags/v1.0.0-interactive-test.2.tar.gz"
  sha256 "258ab61febac914429cad3f0b00f692228ec95543d5fafe43c9002094be60f66"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/utku-caglayan/homebrew-hazelcast-clc/releases/download/hazelcast-commandline-client-2"
    sha256 cellar: :any_skip_relocation, catalina:     "36223067ef24929a128e9b37d89d59569fc65a1acdb1fc00c28e1f39b94f87d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "41f3998410c6374d8f1bfec915216c2b379f7695445a0303017e5468ee9ebda7"
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
