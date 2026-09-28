class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.26/vership-v0.5.26-aarch64-apple-darwin.tar.gz"
      sha256 "01f6a1c4d9efc61135af8563998356c79f3ee3599f64ce7c66d2d791866ef723"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.26/vership-v0.5.26-x86_64-apple-darwin.tar.gz"
      sha256 "cb4310a4a6abc99926c82fec015005a13bb944397aa6b84ee5699b67d697034f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.26/vership-v0.5.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "518ff0ef821bd010ed8e36f9cf5990910826c1338ccd6ec8eb6e0f73a211f6ed"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.26/vership-v0.5.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "686749efd61c77549ac30547df0422c7d4d43530c25d2c69702b3012d40b362b"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
