class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.17/confluence-cli-v0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "84944cb2f82b01d268d2ae01d13d7aa4ff63dbd0a09b552700d5315aecad4875"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.17/confluence-cli-v0.1.17-x86_64-apple-darwin.tar.gz"
      sha256 "2e96dd324f762fcb7547bc3d623e79f353dfb87f9edc25b21ce1cd8064c302a5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.17/confluence-cli-v0.1.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d2d16b3a89c337fc36e70c73b61c0fc051bb3871482f22073337432afce65dd"
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
