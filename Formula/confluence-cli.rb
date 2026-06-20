class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.15/confluence-cli-v0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "ebc5e185b12c823bccaf49c00ad5fa80689a90f46a848008d7ac9a760d20e46d"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.15/confluence-cli-v0.1.15-x86_64-apple-darwin.tar.gz"
      sha256 "14948a6518b326c4a31436178de78ffbc2f00f0acba8df0287bc6d844c078f61"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.15/confluence-cli-v0.1.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bcbaa48c507fbfc8cb275d6cd0adc34bc055f5e4c868bb6d881699502adb1f23"
    else
      odie "Linux ARM is not supported by this formula."
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
