class HazelcastCommandlineClient < Formula
  desc "Home of Hazelcast Command-line Client Project"
  homepage "https://github.com/hazelcast/hazelcast-commandline-client/tree/main"
  url "https://github.com/hazelcast/hazelcast-commandline-client/archive/refs/tags/v0.1.0-preview.2.tar.gz"
  sha256 "2a8d33a02f9069bfff681e790d64bed9e810bae94469c1d4336132ebf2281332"

  bottle do
    root_url "https://github.com/utku-caglayan/homebrew-hazelcast-clc/releases/download/hazelcast-commandline-client-0.1.0-pre"
    sha256 cellar: :any_skip_relocation, big_sur:      "1f7966ab791d4185a3c3f4db9242e5a303578781f423dc4c670a05a3ab192a20"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ee2f64508589c54bf2f34cc924c279ba04994953b6738fa28884a466670eb5ea"
  end

  depends_on "go" => :build

  def install
    system "make"
    bin.install "hzc"
    bash_completion.install "extras/bash_completion.sh"
    zsh_completion.install "extras/zsh_completion.zsh" => "_hzc"
  end

  def post_install
    ohai "Example usages:
* `hzc` - start an interactive shell 🚀
* `hzc map --name my-map put --key hello --value world` - put entry into map"
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
  end

  test do
    system "true"
  end
end
