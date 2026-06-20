class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.14/confluence-cli-v0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "e4fcc00fb9d57f2a3586629b784af9d59e843269248cd32dec7429d1551ecad1"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.14/confluence-cli-v0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "f6ff3e8a00321a1e5dc16e0716c1657310f191fc4d0e880b441a042fea9d71bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.14/confluence-cli-v0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "919563bef743eb19a16e84a32cb6e23223b2054fffbeb6e9b3d1a73dff1812b3"
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
