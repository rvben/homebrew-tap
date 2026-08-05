class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.15/vership-v0.5.15-aarch64-apple-darwin.tar.gz"
      sha256 "cbca61bbf5372efd3fcc837c8803f53dd69418ffaac7d32f5512219b456fc139"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.15/vership-v0.5.15-x86_64-apple-darwin.tar.gz"
      sha256 "4d9eff8742c9b06dd3284e8f84cf0dbb1884892c0f37c378d633f364803a1e6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.15/vership-v0.5.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91020491170a7dccdcf1784e2c15ced62017a73929b5be13c5711c4f9d1d7458"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.15/vership-v0.5.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7202a3f6bf335f3baf27e209756f9ef5eac34b7e3c40228e8ac919feb72fdbf4"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
