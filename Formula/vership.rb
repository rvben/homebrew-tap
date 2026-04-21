class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.0/vership-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "e1097c7938ea53a988811408df6e486e26f730f5e9908313660f4160485a57a0"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.0/vership-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "290b5d84918cdfc41533b0b2735b99ee5917534058e5eca4e12e07c4f50c7597"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.0/vership-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3d823bc4ddab97e259d8da83760de5be990f9371339a9f7b9515a9507365ff7"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.0/vership-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7eef6135ca7b7f4d766f495f9fa3a8a9c8545a5861dde431ad83c24e5c65843c"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
