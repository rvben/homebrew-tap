class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.25/vership-v0.5.25-aarch64-apple-darwin.tar.gz"
      sha256 "2d04bdd9ec2439c40c92df7b22d832d901a6d92e6bece488c165ca21bf077f9a"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.25/vership-v0.5.25-x86_64-apple-darwin.tar.gz"
      sha256 "5764c198693aa655ea86daeaea7fd87f8ee2937c1b2ed964826d858a3740adb5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.25/vership-v0.5.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32c32b2b8630ab0f7f55d6f49b44cf039b293f33dc7f1ce586ab836c57acbcb4"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.25/vership-v0.5.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2c8f108b84bad9dec6c137050cc36768d0f05e36c62dfd99084fbd3fcfb4660"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
