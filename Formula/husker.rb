class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.26/husker-v0.4.26-aarch64-apple-darwin.tar.gz"
      sha256 "cf3c29cef7f877d828e038fccc2bbe4c693d7dec12bae91b01db7b77b1543dbe"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.26/husker-v0.4.26-x86_64-apple-darwin.tar.gz"
      sha256 "48bc68368cf73782d0d1615970c5f48c9296509d84248c312249982130cd6215"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.26/husker-v0.4.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81a4aa98ab77892ec76c298490678d0bdf0f6adce193e0c9fabd7d69489d5abf"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.26/husker-v0.4.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "978af16f4099c89bb436407fd223b4c8ed606bd0a9cce9cd4aa6d95f79ab1a82"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
