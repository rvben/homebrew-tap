class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.27/husker-v0.4.27-aarch64-apple-darwin.tar.gz"
      sha256 "a0ff5d010c34eb3efe4d37dd8d6c8cbae937b86d1e2b4f8face42fea54350682"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.27/husker-v0.4.27-x86_64-apple-darwin.tar.gz"
      sha256 "3bfe4483da192f4a4775284b168ae82359c4ad86da7695e7131a9c959266b2b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.27/husker-v0.4.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "572c469bc355ca584284432b82c2f15a7862fc818da1e6feaafc02140c432777"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.27/husker-v0.4.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "849234a4a3164d6f34209dd802b7fcaea926088afb1f4700ba75159efa1e7bc1"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
