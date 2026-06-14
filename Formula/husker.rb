class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.11/husker-v0.4.11-aarch64-apple-darwin.tar.gz"
      sha256 "fd0340cf262336351c2bf4abdfefb3253e88f0bfb7f188901c9e48ca0c5a0500"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.11/husker-v0.4.11-x86_64-apple-darwin.tar.gz"
      sha256 "dbaa0eff7619d0350c30b34f5aaf376dec5d6ffe17d6433d80712f6a170b74b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.11/husker-v0.4.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c1e5ab545222cc799694160e39c99b07e8eac2244609c9f002a229d0dafbaca7"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.11/husker-v0.4.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f71572769be3463c53917d48f1cd88276685467341f57f152f85ab1ecc7fb65a"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
