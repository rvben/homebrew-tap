class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.16/jira-cli-v0.4.16-aarch64-apple-darwin.tar.gz"
      sha256 "5ab0c6a1bfda51ed3687d12a58aa194f8e32ace0c2fab34eb6b88715b40dc872"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.16/jira-cli-v0.4.16-x86_64-apple-darwin.tar.gz"
      sha256 "140173dee38ed060c40305f2f075ec1755bab455ae8aa7a2bfc71e9af5e72087"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.16/jira-cli-v0.4.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "19c4c6c3bcd50f9d46e51dd6d8f4e8eb169ab9eb483fe4641848a2a02161cc90"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.16/jira-cli-v0.4.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78559c8c9f21cfe865428b9bf5f9d72cefcbad35352abf829d000f1931d1de37"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
