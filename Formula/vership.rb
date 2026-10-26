class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.30/vership-v0.5.30-aarch64-apple-darwin.tar.gz"
      sha256 "930c394115c3fbbc49b9b769003ff38ec71ac2e3cbd4faa1c5b02d947e9aad3d"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.30/vership-v0.5.30-x86_64-apple-darwin.tar.gz"
      sha256 "8f896fd6b0872e63f78b82f4af9cf3d2aaddb2e357b0d6b4aeeb4ca217210cf9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.30/vership-v0.5.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ca58d7bcb21b17c560e2f32981bb382af54cb8df14f710e86288d1237073c6f"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.30/vership-v0.5.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d960a00c0873039e25ada7cfdede2ea2e8d6c83d73880f7bff4323c60747cba6"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
