class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.6/jira-cli-v0.4.6-aarch64-apple-darwin.tar.gz"
      sha256 "54dd6154b7b22353a82ff967d9fbf857c7e28be11e40a9febbac7b388dfda987"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.6/jira-cli-v0.4.6-x86_64-apple-darwin.tar.gz"
      sha256 "f750e8092b44d2041490b3e57bca0a1ace5aa94d700aa8c586d9be5c26663f67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.6/jira-cli-v0.4.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a663fc8cc4ec4ab51bd0bcecb25eca474c621af6a2131d53aae7fea097ca7aa"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.6/jira-cli-v0.4.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d27ed9dc75f5724028ec153aef449f93f6b4ddefc4cafb1a432e5a7be50fff6"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
