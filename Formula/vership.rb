class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.5/vership-v0.5.5-aarch64-apple-darwin.tar.gz"
      sha256 "7a20a7df0632fb471f8c7bb57b4abb4841d7f306624c44558f01b75114147733"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.5/vership-v0.5.5-x86_64-apple-darwin.tar.gz"
      sha256 "12b20786472c833976a07bb08868469191ad650735bbd04ce8c29666f7c16113"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.5/vership-v0.5.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b80e408e95a0c39e3c22fdd31fdec1ccbd6e2ee09617655f187c6e675895a239"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.5/vership-v0.5.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6800609e7b261ffb1f4193fdd27ec0349cd811c0a74645d9441121a085ad18b6"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
