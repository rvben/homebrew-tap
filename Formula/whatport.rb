class Whatport < Formula
  desc "Find what process is listening on a TCP/UDP port, and free it"
  homepage "https://github.com/rvben/whatport"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/whatport/releases/download/v0.1.0/whatport-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "56f54a0b7e6439bb8b3bf1c18692eea3c36f6a09903dc35a6a4cc11c341f3832"
    else
      url "https://github.com/rvben/whatport/releases/download/v0.1.0/whatport-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "e40a62060b0789696fe201854a87806cc29cb54ea5169f83e1985d140620afb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/whatport/releases/download/v0.1.0/whatport-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d109b242e75c069b9c7a105e490ab2cb853a0bf5c8e1899b61bc6a38b4ca327"
    else
      url "https://github.com/rvben/whatport/releases/download/v0.1.0/whatport-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "307078f0ce7c70a4701959434c56deb228d54afe6f065040e9a8f57ac84cdc55"
    end
  end

  def install
    bin.install "whatport"
  end

  test do
    system "#{bin}/whatport", "--version"
  end
end
