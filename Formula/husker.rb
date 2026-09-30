class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.51/husker-v0.4.51-aarch64-apple-darwin.tar.gz"
      sha256 "f0ea57e8884bf71a65bdcceec1ad5f73cbc56b248040831b32da9f623b8ba23b"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.51/husker-v0.4.51-x86_64-apple-darwin.tar.gz"
      sha256 "3b99b7a85a4fd31381974b45fab2e97a497f74152980f1761b4a1793110a0bbb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.51/husker-v0.4.51-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0dfdc7b2c0ecb7ae51f90c5d69619fad9ff55cd82ef2bf07adb12da3531e9846"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.51/husker-v0.4.51-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6efde9ff5729711e89d1dbba59a41331149cd3049fa71fc519e33021f6d67821"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
