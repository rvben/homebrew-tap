class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.16/confluence-cli-v0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "129716daf340c16d6e5b4eca7ac5cdd600db02daf566e289eab3941a408799c0"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.16/confluence-cli-v0.1.16-x86_64-apple-darwin.tar.gz"
      sha256 "cae6d0c354d52ad2454e545e562321791b4590042019d578cc4b9e5bc93db9d1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.16/confluence-cli-v0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c51e72a25d395526088089361f4faf90e660db1b874327df6c721cc8a6b75d62"
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
