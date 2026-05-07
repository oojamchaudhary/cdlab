111111111111111111

#include <iostream>
using namespace std;

string xorOp(string a, string b) {
    string result = "";

    for (int i = 1; i < b.length(); i++) {
        if (a[i] == b[i])
            result += '0';
        else
            result += '1';
    }

    return result;
}

string crc(string data, string key) {
    int k = key.length();

    string temp = data.substr(0, k);

    for (int i = k; i < data.length(); i++) {
        if (temp[0] == '1')
            temp = xorOp(key, temp) + data[i];
        else
            temp = xorOp(string(k, '0'), temp) + data[i];
    }

    if (temp[0] == '1')
        temp = xorOp(key, temp);
    else
        temp = xorOp(string(k, '0'), temp);

    return temp;
}

int main() {
    string data, key = "1001";

    cin >> data;

    string appended = data + string(key.length() - 1, '0');

    string rem = crc(appended, key);

    cout << "CRC: " << rem << endl;
    cout << "Codeword: " << data + rem << endl;

    return 0;
}


222222222222222222

#include <iostream>
using namespace std;

void leakyBucket(int bucketSize, int rate, int packets[], int n) {
    int bucket = 0;

    for (int i = 0; i < n; i++) {

        if (bucket + packets[i] > bucketSize)
            cout << "Packet Dropped\n";
        else {
            bucket += packets[i];
            cout << "Packet Added\n";
        }

        int sent = min(bucket, rate);

        bucket -= sent;

        cout << "Sent: " << sent << endl;
        cout << "Remaining: " << bucket << endl;
    }
}

int main() {
    int n, bucketSize, rate;

    cin >> bucketSize >> rate >> n;

    int packets[n];

    for (int i = 0; i < n; i++)
        cin >> packets[i];

    leakyBucket(bucketSize, rate, packets, n);

    return 0;
}


333333333333333333aaaaaaaaaaa

#include <iostream>
using namespace std;

string encrypt(string text, int key) {
    for (int i = 0; i < text.length(); i++) {
        text[i] = (text[i] - 'a' + key) % 26 + 'a';
    }

    return text;
}

string decrypt(string text, int key) {
    for (int i = 0; i < text.length(); i++) {
        text[i] = (text[i] - 'a' - key + 26) % 26 + 'a';
    }

    return text;
}

int main() {
    string text;
    int key;

    cin >> text >> key;

    string enc = encrypt(text, key);

    cout << enc << endl;
    cout << decrypt(enc, key);

    return 0;
}


3333333333333333bbbbbbbbbb

#include <iostream>
using namespace std;

char matrix[5][5];

void createMatrix(string key) {
    string temp = key + "abcdefghiklmnopqrstuvwxyz";
    string result = "";

    for (char c : temp) {
        if (result.find(c) == string::npos)
            result += c;
    }

    int k = 0;

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            matrix[i][j] = result[k++];
        }
    }
}

void findPos(char c, int &r, int &col) {
    if (c == 'j')
        c = 'i';

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (matrix[i][j] == c) {
                r = i;
                col = j;
            }
        }
    }
}

string encrypt(string text) {
    string ans = "";

    for (int i = 0; i < text.length(); i += 2) {
        int r1, c1, r2, c2;

        findPos(text[i], r1, c1);
        findPos(text[i + 1], r2, c2);

        if (r1 == r2) {
            ans += matrix[r1][(c1 + 1) % 5];
            ans += matrix[r2][(c2 + 1) % 5];
        }
        else if (c1 == c2) {
            ans += matrix[(r1 + 1) % 5][c1];
            ans += matrix[(r2 + 1) % 5][c2];
        }
        else {
            ans += matrix[r1][c2];
            ans += matrix[r2][c1];
        }
    }

    return ans;
}

string decrypt(string text) {
    string ans = "";

    for (int i = 0; i < text.length(); i += 2) {
        int r1, c1, r2, c2;

        findPos(text[i], r1, c1);
        findPos(text[i + 1], r2, c2);

        if (r1 == r2) {
            ans += matrix[r1][(c1 + 4) % 5];
            ans += matrix[r2][(c2 + 4) % 5];
        }
        else if (c1 == c2) {
            ans += matrix[(r1 + 4) % 5][c1];
            ans += matrix[(r2 + 4) % 5][c2];
        }
        else {
            ans += matrix[r1][c2];
            ans += matrix[r2][c1];
        }
    }

    return ans;
}

int main() {
    string key, text;

    cin >> key >> text;

    createMatrix(key);

    string enc = encrypt(text);

    cout << enc << endl;
    cout << decrypt(enc);

    return 0;
}


444444444444444444444

#include <iostream>
using namespace std;

string encrypt(string text, string key) {
    string ans = "";

    for (int i = 0; i < text.length(); i++) {
        char ch = ((text[i] - 'a') + (key[i % key.length()] - 'a')) % 26 + 'a';
        ans += ch;
    }

    return ans;
}

string decrypt(string text, string key) {
    string ans = "";

    for (int i = 0; i < text.length(); i++) {
        char ch = ((text[i] - 'a') - (key[i % key.length()] - 'a') + 26) % 26 + 'a';
        ans += ch;
    }

    return ans;
}

int main() {
    string text, key;

    cin >> text >> key;

    string enc = encrypt(text, key);

    cout << enc << endl;
    cout << decrypt(enc, key);

    return 0;
}


55555555555555555555

#include <iostream>
using namespace std;

long long power(long long a, long long b, long long mod) {
    long long ans = 1;

    for (int i = 0; i < b; i++) {
        ans = (ans * a) % mod;
    }

    return ans;
}

int main() {
    long long p = 3, q = 11;

    long long n = p * q;
    long long e = 3;
    long long d = 7;

    long long msg;

    cin >> msg;

    long long cipher = power(msg, e, n);

    cout << cipher << endl;

    long long plain = power(cipher, d, n);

    cout << plain << endl;

    return 0;
}


66666666666666666666

#include <iostream>
using namespace std;

long long power(long long a, long long b, long long mod) {
    long long ans = 1;

    for (int i = 0; i < b; i++) {
        ans = (ans * a) % mod;
    }

    return ans;
}

int main() {
    long long p, g, a, b;

    cin >> p >> g >> a >> b;

    long long A = power(g, a, p);
    long long B = power(g, b, p);

    long long key1 = power(B, a, p);
    long long key2 = power(A, b, p);

    cout << key1 << endl;
    cout << key2 << endl;

    return 0;
}