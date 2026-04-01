class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.5/confluence-cli-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "b89fdd598a53693e381a10bdb602a804676075119bff36fd42e09ded07439208"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.5/confluence-cli-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "b8d4564bfb8c8356ea2955a1ae4efddca78e7c5e378438a5165adbeb10ba40bc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.5/confluence-cli-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "251f714cb325e276a2693ec66ec8077911cab2d0fd1d27ec9b74fd0219bf5f1c"
    else
      odie "Linux ARM is not supported by this formula."
    end
  end

  def install
    bin.install "confluence-cli"
  end

  test do
    assert_match "confluence-cli #{version}", shell_output("#{bin}/confluence-cli --version")
  end
end
