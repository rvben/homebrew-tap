class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.13/vership-v0.5.13-aarch64-apple-darwin.tar.gz"
      sha256 "140f0a314f5667a07dfa617bf462cc198fdafe0557f3049983cfee3464c2b9ff"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.13/vership-v0.5.13-x86_64-apple-darwin.tar.gz"
      sha256 "7dade833865a8fabd880928b3becd97814c7252bf7b50dce34d55152a353ee73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.13/vership-v0.5.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "68509aa40c1d6c0c78525e49b0d136eee0e9dc4f63dd9b3b05e35fd0ae518862"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.13/vership-v0.5.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df00c5a9273f74fc4e69521ba30d9d7393343bad6950a2e2b662e2de515c9ae2"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
