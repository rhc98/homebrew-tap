class Streambreak < Formula
  desc "Break-time content app for developers — RSS feeds & mini-games with Claude Code hooks"
  homepage "https://github.com/rhc98/streambreak"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rhc98/streambreak/releases/download/v0.1.0/streambreak-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "193f78da161b1e6e5b17821322aece0664d3f629811ab9810f92b9d417bfa040"
    end
  end

  def install
    bin.install "streambreak"
  end

  def post_install
    system bin/"streambreak", "init"
  end

  def caveats
    <<~EOS
      To start the streambreak daemon:
        streambreak

      Claude Code hooks have been registered automatically.
      Restart Claude Code to activate hooks.

      To customize settings:
        streambreak config edit
    EOS
  end

  test do
    assert_match "streambreak", shell_output("#{bin}/streambreak --help", 2)
  end
end
