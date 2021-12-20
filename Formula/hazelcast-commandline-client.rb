class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/main"
  url "https://github.com/hazelcast/hazelcast-commandline-client/archive/refs/tags/v1.0.0-test.10.tar.gz"
  sha256 "d31d5a95a2d64e10c3e37fb80d96ac9e2bafe7560ce85e8bf8b0cfb36b4b639f"

  bottle do
    root_url "https://github.com/utku-caglayan/homebrew-hazelcast-clc/releases/download/hazelcast-commandline-client-10"
    sha256 cellar: :any_skip_relocation, big_sur:      "cf0611fe83cb17c90cd9800a374b686b73724c542c2fddf16bbe0f22538a8cfb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "29375382fd5f8e928fb4199de7cd059a70098125b6d1d5b3ac1b06323f2fcf5f"
  end

  depends_on "go" => :build

  def install
    system "make"
    bin.install "hzc"
    bash_completion.install "extras/bash_completion.sh"
    zsh_completion.install "extras/zsh_completion.zsh" => "_hzc"
  end

  def post_install
    completion_warning = <<~EOS
      ⚠️  To have superior experience, enable autocompletion on Brew. ⚠️
      You need to enable autocompletion just once for Brew. If it is already enabled, you can skip this part.

      ▪ For Bash users:
        1) `brew install bash-completion` and follow the printed \"Caveats\" section. Example \"Caveats\" instructions:
           Add the following line to your ~/.bash_profile:
           # !! Note that paths may differ depending on your installation, so you should follow the Caveats section on your system.
           [[ -r \"/home/ubuntu/.linuxbrew/etc/profile.d/bash_completion.sh\" ]] && . \"/home/ubuntu/.linuxbrew/etc/profile.d/bash_completion.sh\"
        2) `source ~/.bash_profile`

      ▪ For Zsh users:
      Follow https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh

    EOS
    print completion_warning

    ohai "Example usages:
* `hzc` - start an interactive shell 🚀
* `hzc map --name my-map put --key hello --value world` - put entry into map"
  end

  test do
    system "true"
  end
end
