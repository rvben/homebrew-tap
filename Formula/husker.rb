class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.12/husker-v0.4.12-aarch64-apple-darwin.tar.gz"
      sha256 "de63c9899ba4d22b4cb4fe863748ee46da8a39d5f1141475414008c45f51ff44"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.12/husker-v0.4.12-x86_64-apple-darwin.tar.gz"
      sha256 "bb23e3a346886242d7d5269099fec62b3cc1f2520c16eea9c86d1985a7ece5df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.12/husker-v0.4.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "54edf022dc578e632ad4b1e7a6a643be6bc3ecee2435d2f8dca40d065f93fca3"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.12/husker-v0.4.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "517462bfcbf17dc93c0e961cedfa20252d6adeb822c736585024bbf7d043437d"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
