#ifndef COMMUNICATORVIEWCONTROLLER_H
#define COMMUNICATORVIEWCONTROLLER_H

#include <QMainWindow>
#include "qextserialport.h"

namespace Ui {
class CommunicatorViewController;
}

class CommunicatorViewController : public QMainWindow
{
    Q_OBJECT
    
public:
    explicit CommunicatorViewController(QWidget *parent = 0);
    ~CommunicatorViewController();

private:
    QextSerialPort *port;
    Ui::CommunicatorViewController *ui;
    void printData(QByteArray* receivedData);
    const char *byte_to_binary(char x);

public slots:
    void onDataAvailable();
private slots:
    void on_stepButton_clicked();
    void on_freeRunningButton_clicked();
};

#endif // COMMUNICATORVIEWCONTROLLER_H
