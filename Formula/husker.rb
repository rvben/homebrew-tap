class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.10/husker-v0.4.10-aarch64-apple-darwin.tar.gz"
      sha256 "6f6a59c605c6737d968d0ba8ea906926e07fe9e525a514506410be3ba241a91c"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.10/husker-v0.4.10-x86_64-apple-darwin.tar.gz"
      sha256 "ec6c190ca96b7e50b8b830cd07ae93eea63a706f1facfa6c42108e3cf8e79ad7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.10/husker-v0.4.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "36a6d9ac71f11d9b9369bbe886d18e546986ca432085bf50e137971f47141d9f"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.10/husker-v0.4.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9bbe44c4aeea7673c76cbeee0ffa10a5aafd1f5fe1fe50d8732f0d09b4ebc831"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
