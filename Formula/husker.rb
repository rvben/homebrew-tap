class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.16/husker-v0.4.16-aarch64-apple-darwin.tar.gz"
      sha256 "2509243fd1a836d93c4bc1100c0445c587ac9fa1cd7de3e8bd836266f6476f99"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.16/husker-v0.4.16-x86_64-apple-darwin.tar.gz"
      sha256 "01590d69cafe6e7ab054508b0682081aba2749eaa7c488753dae48e85d0ac2c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.16/husker-v0.4.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f62f0f69e8baf77f4148e7b9c716c1f0adb9aa6dc188d19fcea882279e58bcdd"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.16/husker-v0.4.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dfaa48e5f30ea6d867c853f3c19f05db69198cf1d24d36dfd9291058a1e07aed"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
