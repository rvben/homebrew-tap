class Openarchieven < Formula
  desc "Command-line interface to the openarchieven.nl Dutch genealogical API"
  homepage "https://github.com/rvben/openarchieven-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.2.0/openarchieven-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "df245053c3cf86d04ca672b94e8387007ed7d631e38ed7608462e83512112b31"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.2.0/openarchieven-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "e6cd2fd7f1a18f5eb06fcacaf798da356e02d81396a6cde4a483bcc40016a5b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.2.0/openarchieven-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d10ee57846fe7a6ea07d3fe6cad5658ece05f639894696ccb3efb67b214f2b6a"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.2.0/openarchieven-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fbc331b0a4bb800c8fc1d1e901f9c61f82b9d3b18781cf6533a2520b4532751b"
    end
  end

  def install
    bin.install "openarchieven"
  end

  test do
    system "#{bin}/openarchieven", "version"
  end
end
