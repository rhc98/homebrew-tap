class Streambreak < Formula
  desc "Break time content during AI coding waits"
  homepage "https://github.com/rhc98/streambreak"
  version "0.2.1"
  url "https://github.com/rhc98/streambreak/releases/download/v0.2.1/streambreak-universal-apple-darwin.tar.gz"
  sha256 "100a5115696bdf728f599ec939a95ef580d659151640f406a737ca727ff1d3cc"

  def install
    bin.install "streambreak"
  end

  def caveats
    <<~EOS
      If macOS blocks the binary (Gatekeeper), run:
        xattr -d com.apple.quarantine #{bin}/streambreak

      Then set up Claude Code hooks:
        streambreak init
    EOS
  end

  test do
    system "#{bin}/streambreak", "--version"
  end
end
