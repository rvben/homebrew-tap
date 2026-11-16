class YoobiCli < Formula
  desc "Read, plan and verify Yoobi timesheet updates from the command line"
  homepage "https://github.com/rvben/yoobi-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yoobi-cli/releases/download/v0.1.2/yoobi-cli-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "5be0bbe80ca5071269488aaa087cb271139ed539dd1f4f74f6807a8a372fe566"
    else
      url "https://github.com/rvben/yoobi-cli/releases/download/v0.1.2/yoobi-cli-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "bb0f9899bcb4dfdca01685acf9e19bc80056b2ae7040ec69a0fc3e3715174feb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yoobi-cli/releases/download/v0.1.2/yoobi-cli-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9eeefc0263ef84d7583fbfbed0aac689dd4834f49853d8c8d3b8b998ab886f9b"
    else
      url "https://github.com/rvben/yoobi-cli/releases/download/v0.1.2/yoobi-cli-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d56736f35384dbea0ea462c1d47728749a37a9e8f6903c060eddd6687367fca"
    end
  end

  def install
    bin.install "yoobi-cli"
  end

  test do
    system "#{bin}/yoobi-cli", "--version"
  end
end
