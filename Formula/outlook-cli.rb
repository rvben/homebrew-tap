class OutlookCli < Formula
  desc "Read and manage Outlook mail and calendars"
  homepage "https://github.com/rvben/outlook-cli"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/outlook-cli/releases/download/v0.2.5/outlook-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "6e5bde8a167ac6683a1e080f141b537ad9aaba4dcccd4f46bd2076cf906fee6f"
    else
      url "https://github.com/rvben/outlook-cli/releases/download/v0.2.5/outlook-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "830ee5eed1a3202ac6aa26cf4cc3dbc9b603c8146ddd64fec038233e78ca7829"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/outlook-cli/releases/download/v0.2.5/outlook-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "719bd03e3c04748eccba59486be2f4de15914e12a0d318d21a2aa86a872678d7"
    else
      url "https://github.com/rvben/outlook-cli/releases/download/v0.2.5/outlook-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "671798a0dea7d9b024b59533c5eca5ee6c879c78f273c828d5e66e70056e27b7"
    end
  end

  def install
    bin.install "outlook"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/outlook --version")
    assert_match "Usage:", shell_output("#{bin}/outlook --help")
  end
end
