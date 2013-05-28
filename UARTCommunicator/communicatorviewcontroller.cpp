#include "communicatorviewcontroller.h"
#include "ui_communicatorviewcontroller.h"
#include <QThread>

CommunicatorViewController::CommunicatorViewController(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::CommunicatorViewController)
{
    //port = new QextSerialPort(ui->comPortComboBox->itemData(ui->comPortComboBox->currentIndex()));
    port = new QextSerialPort("COM3");
    connect(port, SIGNAL(readyRead()), this, SLOT(onDataAvailable()));
    port->setBaudRate(BAUD19200);
    port->setFlowControl(FLOW_OFF);
    port->setParity(PAR_NONE);
    port->setStopBits(STOP_1);
    port->setDataBits(DATA_8);
    port->open(QIODevice::ReadWrite);
    ui->setupUi(this);
}

CommunicatorViewController::~CommunicatorViewController()
{
    delete ui;
}

void CommunicatorViewController::printData(QByteArray *receivedData)
{
    QString *output = new QString();

    output->append("----------- Instruction Fetch -----------\n");
    //CurrentPC
    output->append("Current PC: ");
    output->append(byte_to_binary(receivedData->at(0)-1));
    output->append("\n");

    //NextPC
    output->append("PC saliendo del IF: ");
    output->append(byte_to_binary(receivedData->at(1)-1));
    output->append("\n");

    //Instruccion fetched
    output->append("Fetched instruction: ");
    output->append(byte_to_binary(receivedData->at(2)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(3)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(4)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(5)));
    output->append("\n\n");

    //Instruction Decode Registers
    output->append("----------- Instruction Decode -----------\n");
    output->append("Registro 0: ");
    output->append(byte_to_binary(receivedData->at(6)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(7)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(8)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(9)));
    output->append("\n");

    output->append("Registro 1: ");
    output->append(byte_to_binary(receivedData->at(10)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(11)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(12)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(13)));
    output->append("\n");

    output->append("Registro 2: ");
    output->append(byte_to_binary(receivedData->at(14)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(15)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(16)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(17)));
    output->append("\n");

    output->append("Registro 3: ");
    output->append(byte_to_binary(receivedData->at(18)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(19)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(20)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(21)));
    output->append("\n");

    output->append("Registro 4: ");
    output->append(byte_to_binary(receivedData->at(22)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(23)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(24)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(25)));
    output->append("\n");

    output->append("Registro 5: ");
    output->append(byte_to_binary(receivedData->at(26)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(27)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(28)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(29)));
    output->append("\n");

    output->append("Registro 6: ");
    output->append(byte_to_binary(receivedData->at(30)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(31)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(32)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(33)));
    output->append("\n");

    output->append("Registro 7: ");
    output->append(byte_to_binary(receivedData->at(34)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(35)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(36)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(37)));
    output->append("\n");

    output->append("Registro 8: ");
    output->append(byte_to_binary(receivedData->at(38)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(39)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(40)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(41)));
    output->append("\n");

    output->append("Registro 9: ");
    output->append(byte_to_binary(receivedData->at(42)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(43)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(44)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(45)));
    output->append("\n");

    output->append("Registro 10: ");
    output->append(byte_to_binary(receivedData->at(46)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(47)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(48)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(49)));
    output->append("\n");

    output->append("Registro 11: ");
    output->append(byte_to_binary(receivedData->at(50)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(51)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(52)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(53)));
    output->append("\n");

    output->append("Registro 12: ");
    output->append(byte_to_binary(receivedData->at(54)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(55)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(56)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(57)));
    output->append("\n");

    output->append("Registro 13: ");
    output->append(byte_to_binary(receivedData->at(58)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(59)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(60)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(61)));
    output->append("\n");

    output->append("Registro 14: ");
    output->append(byte_to_binary(receivedData->at(62)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(63)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(64)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(65)));
    output->append("\n");

    output->append("Registro 15: ");
    output->append(byte_to_binary(receivedData->at(66)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(67)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(68)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(69)));
    output->append("\n");

    output->append("Registro 16: ");
    output->append(byte_to_binary(receivedData->at(70)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(71)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(72)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(73)));
    output->append("\n");

    output->append("Registro 17: ");
    output->append(byte_to_binary(receivedData->at(74)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(75)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(76)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(77)));
    output->append("\n");

    output->append("Registro 18: ");
    output->append(byte_to_binary(receivedData->at(78)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(79)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(80)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(81)));
    output->append("\n");

    output->append("Registro 19: ");
    output->append(byte_to_binary(receivedData->at(82)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(83)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(84)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(85)));
    output->append("\n");

    output->append("Registro 20: ");
    output->append(byte_to_binary(receivedData->at(86)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(87)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(88)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(89)));
    output->append("\n");

    output->append("Registro 21: ");
    output->append(byte_to_binary(receivedData->at(90)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(91)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(92)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(93)));
    output->append("\n");

    output->append("Registro 22: ");
    output->append(byte_to_binary(receivedData->at(94)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(95)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(96)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(97)));
    output->append("\n");

    output->append("Registro 23: ");
    output->append(byte_to_binary(receivedData->at(98)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(99)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(100)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(101)));
    output->append("\n");

    output->append("Registro 24: ");
    output->append(byte_to_binary(receivedData->at(102)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(103)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(104)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(105)));
    output->append("\n");

    output->append("Registro 25: ");
    output->append(byte_to_binary(receivedData->at(106)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(107)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(108)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(109)));
    output->append("\n");

    output->append("Registro 26: ");
    output->append(byte_to_binary(receivedData->at(110)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(111)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(112)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(113)));
    output->append("\n");

    output->append("Registro 27: ");
    output->append(byte_to_binary(receivedData->at(114)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(115)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(116)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(117)));
    output->append("\n");

    output->append("Registro 28: ");
    output->append(byte_to_binary(receivedData->at(118)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(119)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(120)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(121)));
    output->append("\n");

    output->append("Registro 29: ");
    output->append(byte_to_binary(receivedData->at(122)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(123)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(124)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(125)));
    output->append("\n");

    output->append("Registro 30: ");
    output->append(byte_to_binary(receivedData->at(126)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(127)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(128)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(129)));
    output->append("\n");

    output->append("Registro 31: ");
    output->append(byte_to_binary(receivedData->at(130)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(131)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(132)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(133)));
    output->append("\n\n");

    output->append("Data A (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(134)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(135)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(136)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(137)));
    output->append("\n");

    output->append("Data B (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(138)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(139)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(140)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(141)));
    output->append("\n");

    output->append("Extension de signo (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(142)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(143)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(144)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(145)));
    output->append("\n");

    output->append("Destino del salto (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(146)));
    output->append("\n");

    output->append("Registro destino r-type (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(147)));
    output->append("\n");

    output->append("Registro destino l-type (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(148)));
    output->append("\n");

    output->append("SA (Reg ID/EX)");
    output->append(byte_to_binary(receivedData->at(184)));
    output->append("\n");

    //Flags de control ID/EX
    output->append("*** Flags de control - ID/EX ***\n\n");

    output->append("RegDst (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(149)));
    output->append("\n");

    output->append("ALUSrc (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(150)));
    output->append("\n");

    output->append("MemToReg (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(151)));
    output->append("\n");

    output->append("RegWrite (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(152)));
    output->append("\n");

    output->append("MemRead (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(153)));
    output->append("\n");

    output->append("MemWrite (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(154)));
    output->append("\n");

    output->append("Branch (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(155)));
    output->append("\n");

    output->append("ALUOp (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(156)));
    output->append("\n");

    output->append("Bne (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(185)));
    output->append("\n");

    output->append("Jump (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(186)));
    output->append("\n");

    output->append("sel_dire_salto (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(187)));
    output->append("\n");

    output->append("op_code (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(188)));
    output->append("\n");

    output->append("trunk_mode (Reg ID/EX): ");
    output->append(byte_to_binary(receivedData->at(189)));
    output->append("\n\n");

    output->append("----------- Execute -----------\n");

    output->append("Resultado de la ALU (Reg IE/MEM): ");
    output->append(byte_to_binary(receivedData->at(157)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(158)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(159)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(160)));
    output->append("\n");

    output->append("Data B (Reg IE/MEM): ");
    output->append(byte_to_binary(receivedData->at(161)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(162)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(163)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(164)));
    output->append("\n");

    output->append("Destino del salto (Reg EX/MEM): ");
    output->append(byte_to_binary(receivedData->at(165)));
    output->append("\n");

    output->append("Registro destino (Reg EX/MEM): ");
    output->append(byte_to_binary(receivedData->at(167)));
    output->append("\n\n");

    //Flags de control EX/MEM
    output->append("*** Flags de control - EX/MEM ***\n\n");

    output->append("MemToReg (Reg EX/MEM): ");
    output->append(byte_to_binary(receivedData->at(168)));
    output->append("\n");

    output->append("RegWrite (Reg EX/MEM): ");
    output->append(byte_to_binary(receivedData->at(169)));
    output->append("\n");

    output->append("MemRead (Reg EX/MEM): ");
    output->append(byte_to_binary(receivedData->at(170)));
    output->append("\n");

    output->append("MemWrite (Reg EX/MEM): ");
    output->append(byte_to_binary(receivedData->at(171)));
    output->append("\n");

    output->append("trunk_mode (Reg EX/MEM): ");
    output->append(byte_to_binary(receivedData->at(190)));
    output->append("\n\n");

    output->append("----------- MEM -----------\n");
    output->append("Memory data (Reg MEM/WB): ");
    output->append(byte_to_binary(receivedData->at(173)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(174)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(175)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(176)));
    output->append("\n");

    output->append("Resultado de la ALU (Reg MEM/WB): ");
    output->append(byte_to_binary(receivedData->at(177)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(178)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(179)));
    output->append("_");
    output->append(byte_to_binary(receivedData->at(180)));
    output->append("\n");

    output->append("Registro destino (Reg MEM/WB): ");
    output->append(byte_to_binary(receivedData->at(181)));
    output->append("\n\n");

    //Flags de control MEM/WB
    output->append("*** Flags de control - MEM/WB ***\n\n");

    output->append("MemToReg (Reg MEM/WB): ");
    output->append(byte_to_binary(receivedData->at(182)));
    output->append("\n");

    output->append("RegWrite (Reg MEM/WB): ");
    output->append(byte_to_binary(receivedData->at(183)));
    output->append("\n");

    ui->output->setText(*output);
}

const char * CommunicatorViewController::byte_to_binary(char x)
{
    static char b[9];
    b[0] = '\0';
    int z;
    for (z = 128; z > 0; z >>= 1)
    {
        strcat(b, ((x & z) == z) ? "1" : "0");
    }
    return b;
}

/*
 * SLOTS
 */

void CommunicatorViewController::onDataAvailable()
{
    ui->stepButton->setEnabled(false);
    ui->freeRunningButton->setEnabled(false);
    QThread::msleep(500);
    QByteArray data = port->readAll();
    QString *receivedText = new QString(data);
    if(receivedText->length() > 0)
    {
        //ui->output->setText(QString(data));
        printData(&data);
    }
    ui->stepButton->setEnabled(true);
    ui->freeRunningButton->setEnabled(true);
}

void CommunicatorViewController::on_stepButton_clicked()
{
    port->write("s");
}

void CommunicatorViewController::on_freeRunningButton_clicked()
{
    ui->stepButton->setEnabled(false);
    ui->freeRunningButton->setEnabled(false);

    QByteArray data;
    for(int i = 0; i < 60; i++)
    {
        port->write("s");
        QThread::msleep(200);
        data = port->readAll();
    }

    QString *receivedText = new QString(data);
    if(receivedText->length() > 0)
    {
        //ui->output->setText(QString(data));
        printData(&data);
    }

    ui->stepButton->setEnabled(true);
    ui->freeRunningButton->setEnabled(true);
}
