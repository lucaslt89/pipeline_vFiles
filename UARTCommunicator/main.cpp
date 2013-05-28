#include "communicatorviewcontroller.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    CommunicatorViewController w;
    w.show();
    
    return a.exec();
}
