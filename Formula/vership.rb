class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.19/vership-v0.5.19-aarch64-apple-darwin.tar.gz"
      sha256 "5cf8e1bbaf1653fd77f53babc699a5223014baff8ec12b3aff23529ed1447d8f"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.19/vership-v0.5.19-x86_64-apple-darwin.tar.gz"
      sha256 "8ba9c40c68c8894635934a5fc9b2380be800a3e572e088b0930fee3581e14141"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.19/vership-v0.5.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91699a678244aab9ba68c8b2cc885422a3c30d8069fe2c1099a6ea6d5723170b"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.19/vership-v0.5.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b18519ac17aa0d95de6c33fb1713020c099b0f81acf5e63a8c502c614d1c5a93"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
