class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.28/vership-v0.5.28-aarch64-apple-darwin.tar.gz"
      sha256 "2d6cbb0073ca0f2517ec5f082b499df9751faebf608889f482809d90831235e5"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.28/vership-v0.5.28-x86_64-apple-darwin.tar.gz"
      sha256 "fc6e085e7838ed08679971a5a22c1bb9fcf6a85b2aae45faf12406d3472808f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.28/vership-v0.5.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b366bfcf5743a09d077d2a91518124920e13750f310b383a853d18d795e97b5e"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.28/vership-v0.5.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1d301b932ac66c4736bbf56b3917aec97f658c1319176ce5e9255ad654d0bfa"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
