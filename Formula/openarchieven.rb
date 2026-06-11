class Openarchieven < Formula
  desc "Command-line interface to the openarchieven.nl Dutch genealogical API"
  homepage "https://github.com/rvben/openarchieven-cli"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.1/openarchieven-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "1fe5558adc779de9855d55c8271d274249f8f0da35bc472fae8840c5e0802f2f"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.1/openarchieven-0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "533c0350bc6e98dfc8cc17295dab407cbd565cf7c21ccc194ec22ad9dc0a218b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.1/openarchieven-0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0a665d90d5302578fa0fa34c3bd66183f37528313345d5b7e6d6d48134f3bfa8"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.1/openarchieven-0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1780ec9c883fe16eb94f1610367d39e21e5f8e93037dc58387721ed2f4bfa9bb"
    end
  end

  def install
    bin.install "openarchieven"
  end

  test do
    system "#{bin}/openarchieven", "version"
  end
end
