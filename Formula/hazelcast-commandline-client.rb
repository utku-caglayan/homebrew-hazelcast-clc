class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/main"
  url "https://github.com/hazelcast/hazelcast-commandline-client/archive/refs/tags/v1.0.0-test.6.tar.gz"
  sha256 "4c3a6ce10516ccc4eaa1ccc13c5ca28da73905ac0f32750ee6a9de43ac9bdcd8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/utku-caglayan/homebrew-hazelcast-clc/releases/download/hazelcast-commandline-client-6"
    rebuild 3
    sha256 cellar: :any_skip_relocation, catalina:     "591f374034ac48a4ced4a66f5180ebaf993a87ecba0231964ea2e7e04b120ce4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "be22f1211ad393dc64bc127fea6cd14ea62c61988b963b1f6c5c6e7b5be94b92"
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
* `hzc` - start interactive shell
* `hzc map --name my-map put --key hello --value world` - put entry into map directly
* `hzc --help` - print help"
  end

  test do
    system "true"
  end
end
