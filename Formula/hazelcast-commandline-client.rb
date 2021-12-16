class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/main"
  url "https://github.com/hazelcast/hazelcast-commandline-client/archive/refs/tags/v1.0.0-test.9.tar.gz"
  sha256 "53268981fdcd4e3459de406ee1ff82cb23bb5686fdae12278aaa49a64e137de0"

  bottle do
    root_url "https://github.com/utku-caglayan/homebrew-hazelcast-clc/releases/download/hazelcast-commandline-client-9"
    rebuild 1
    sha256 cellar: :any_skip_relocation, big_sur:      "cdfb6ef5a552a6cc8d469a3b58c67488654d8bbd2b6f12020ddb735857cda889"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7fb1e3b0f5147c8080ad81847b21d70d0b6825b55ba2c30069bb5b10570aaf21"
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
