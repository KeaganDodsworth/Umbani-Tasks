using System;
using System.IO;
using System.Security.Cryptography;
using System.Windows.Forms;

namespace EncryptionApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnEncrypt_Click(object sender, EventArgs e)
        {

            string inputText = txtInput.Text;

            if (string.IsNullOrWhiteSpace(inputText))
            {
                MessageBox.Show("Please enter some text to encrypt.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else 
            { 

            string encryptedText = AesEncryption.Encrypt(inputText);
            txtEncrypted.Text = encryptedText;
            }
        }

        private void btnDecrypt_Click(object sender, EventArgs e)
        {
            string encryptedText = txtEncrypted.Text;

            if (string.IsNullOrWhiteSpace(encryptedText))
            {
                MessageBox.Show("There is no text to decrypt.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else
            {

                string decrypteText = AesEncryption.Decrypt(encryptedText);
                txtDecrypted.Text = decrypteText;
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            txtInput.Clear();
            txtEncrypted.Clear();
            txtDecrypted.Clear();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }

    public static class AesEncryption
    {
        
        private static byte[] GenerateRandomKey()
        {
            using(Aes aes = Aes.Create())
            {
                aes.KeySize = 256;
                aes.GenerateKey();
                return aes.Key;
            }
        }

        private static readonly byte[] Key = GenerateRandomKey();

        public static string Encrypt(string InputText)
        {
            using (Aes aes = Aes.Create())
            {
                aes.Key = Key;
                aes.Mode = CipherMode.ECB;
                aes.Padding = PaddingMode.PKCS7;

                ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);
                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {
                            swEncrypt.Write(InputText);
                        }
                    }
                    return Convert.ToBase64String(msEncrypt.ToArray());
                }

            }
        }

        public static string Decrypt (string cipherText) 
        {
            using (Aes aes = Aes.Create())
            {
                aes.Key = Key;
                aes.Mode = CipherMode.ECB;
                aes.Padding = PaddingMode.PKCS7;

                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);
                using (MemoryStream msDecrypt = new MemoryStream(Convert.FromBase64String(cipherText)))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))

                            return srDecrypt.ReadToEnd();

                    }
                }
            }

        }
    }
}
