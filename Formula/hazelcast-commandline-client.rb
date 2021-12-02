class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/main"
  url "https://github.com/hazelcast/hazelcast-commandline-client/archive/refs/tags/v1.0.0-test.7.tar.gz"
  sha256 "6ae81f4305e66fe1c7afc854d7174e5828b77260fa0c296fb4ff26a71139e491"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/utku-caglayan/homebrew-hazelcast-clc/releases/download/hazelcast-commandline-client-7"
    sha256 cellar: :any_skip_relocation, catalina:     "7f5290cab1023bd5ebf93e1a8062f5baeb99815a50c6e3f522bee08313b7e55d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "18d925e22ea3ad56422c321dc9f4cc395faf951fa0a58d56ae4dbb21f99946ec"
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
* `hzc` - start an interactive shell
* `hzc map --name my-map put --key hello --value world` - put entry into map"
  end

  test do
    system "true"
  end
end
