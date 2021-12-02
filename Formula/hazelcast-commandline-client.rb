class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/utku-caglayan/hazelcast-commandline-client/tree/pre-testing"
  url "https://github.com/utku-caglayan/hazelcast-commandline-client/archive/refs/tags/v1.0.0-test.9.tar.gz"
  sha256 "0ee559b88b524b2eee2ebb39b76161f3403a41c4a49d33e2fe7044e56e6abc6e"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/utku-caglayan/homebrew-hazelcast-clc/releases/download/hazelcast-commandline-client-9"
    sha256 cellar: :any_skip_relocation, catalina:     "26bf6247bc25b15b9c6a415e9cbbcf229f750ac5e8d195e702f0aa297a421485"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0b24ec4645abbd8a084e05d426ebb074c31a2c3d737184c2ef141437b93632b9"
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
    completion_warning = <<~EOS
      ⚠️ To have superior experience, enable autocompletion on Brew.
      You need to enable autocompletion just once for Brew. If it is already enabled, you can skip this part.

      ▪ For Bash users:
      `brew install bash-completion` and follow the printed \"Caveats\" section. Example \"Caveats\" instructions:
        Add the following line to your ~/.bash_profile:
        [[ -r \"/home/ubuntu/.linuxbrew/etc/profile.d/bash_completion.sh\" ]] && . \"/home/ubuntu/.linuxbrew/etc/profile.d/bash_completion.sh\"
        !! Note that paths may differ depending on your installation, so you should follow the Caveats section on your system."

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
