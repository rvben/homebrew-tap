class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.10/confluence-cli-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "8b94521b1889340dcaa63757a038e98398f6fcc259f52835d2305abe9b699e49"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.10/confluence-cli-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "417a93b3faea7aa160552d59a1f9f19ba702cb0b6a3be67cf149b73a26cb1f90"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.10/confluence-cli-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "97179c5d460faff4656f08e07e957867f7071b75a6f0c684c135318e814d2219"
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
