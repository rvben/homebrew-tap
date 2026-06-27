class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.10/vership-v0.5.10-aarch64-apple-darwin.tar.gz"
      sha256 "e0dce8ca578ee3bc73e5b62390557cea5589da3089b7982f16426b53ff463410"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.10/vership-v0.5.10-x86_64-apple-darwin.tar.gz"
      sha256 "ecc8fbed0edd01683de84d7187911b3905ff77e035a4f886662c3167f57bb651"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.10/vership-v0.5.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4c47265aeb8c3d700c88b1afd9242a6a66de8f56036da20cf65bdd07e593f32"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.10/vership-v0.5.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ef0775418092845ae5669d34fcba3d37b0f023098300fb7dcb62b773815b304"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
