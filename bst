#include <iostream>
using namespace std;

struct Node {
    string title;
    Node* left;
    Node* right;
};

// Create new node
Node* create(string title) {
    Node* newNode = new Node();
    newNode->title = title;
    newNode->left = newNode->right = NULL;
    return newNode;
}

// Insert into BST
Node* insert(Node* root, string title) {
    if (root == NULL)
        return create(title);

    if (title < root->title)
        root->left = insert(root->left, title);
    else
        root->right = insert(root->right, title);

    return root;
}

// Search book
void search(Node* root, string key) {
    if (root == NULL) {
        cout << "Book not found\n";
        return;
    }

    if (root->title == key) {
        cout << "Book Found: " << root->title << endl;
        return;
    }

    if (key < root->title)
        search(root->left, key);
    else
        search(root->right, key);
}

// Inorder traversal
void display(Node* root) {
    if (root != NULL) {
        display(root->left);
        cout << root->title << " ";
        display(root->right);
    }
}

int main() {
    Node* root = NULL;
    int ch;
    string book;

    do {
        cout << "\n1.Insert\n2.Search\n3.Display\n4.Exit\n";
        cout << "Enter choice: ";
        cin >> ch;

        switch (ch) {
        case 1:
            cout << "Enter book title: ";
            cin >> book;
            root = insert(root, book);
            break;

        case 2:
            cout << "Enter book to search: ";
            cin >> book;
            search(root, book);
            break;

        case 3:
            cout << "Books (Sorted): ";
            display(root);
            cout << endl;
            break;
        }
    } while (ch != 4);

    return 0;
}
