class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.7/vership-v0.5.7-aarch64-apple-darwin.tar.gz"
      sha256 "72d31888c06a253f9204aa894065f7993071775228101bd6225541f80bb5d5ec"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.7/vership-v0.5.7-x86_64-apple-darwin.tar.gz"
      sha256 "538fb8a3f6b66010ad2794f5114829bc52153cf2565fc0af4288626b88a23cb5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.7/vership-v0.5.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "367bfe4f292503505ac8f6b84f6b24989d8841153d2e4d0061913d641dce4a99"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.7/vership-v0.5.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "744c1fc6fe779211e03da454227054db7711ef9e3d8314609a7aec65c74f432e"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
