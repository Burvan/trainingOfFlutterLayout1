import 'package:flutter/material.dart';

class TelegramMenu extends StatelessWidget {
  TelegramMenu({Key? key}) : super(key: key);

  final List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite_outlined, 'Избранное'),
    MenuRowData(Icons.call, 'Недавние звонки'),
    MenuRowData(Icons.devices, 'Устройства'),
    MenuRowData(Icons.folder, 'Папка с чатами'),
  ];

  final List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notification_add, 'Уведомления и звуки'),
    MenuRowData(Icons.lock, 'Конфиденциальность'),
    MenuRowData(Icons.dataset, 'Данные и память'),
    MenuRowData(Icons.brush, 'Оформление'),
    MenuRowData(Icons.language, 'Язык'),
  ];

  final List<MenuRowData> thirdMenuRow = [
    MenuRowData(Icons.star, 'Telegram Premium'),
  ];

  final List<MenuRowData> fourthMenuRow = [
    MenuRowData(Icons.message, 'Задать вопрос'),
    MenuRowData(Icons.question_mark, 'Вопросы о Telegram'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Настройки'),
        centerTitle: true,
        backgroundColor: Colors.indigo[300],
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _UserInfo(),
            SizedBox(height: 20),
            _MenuWidget(menuRow: firstMenuRow),
            SizedBox(height: 20),
            _MenuWidget(menuRow: secondMenuRow),
            SizedBox(height: 20),
            _MenuWidget(menuRow: thirdMenuRow),
            SizedBox(height: 20),
            _MenuWidget(menuRow: fourthMenuRow),
          ],
        ),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;
  MenuRowData(this.icon, this.text);
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({Key? key, required this.menuRow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList(),
      ),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;

  const _MenuWidgetRow({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(data.icon),
          SizedBox(width: 15),
          Expanded(child: Text(data.text)),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: const [
              SizedBox(height: 20),
              _AvatarWidget(),
              SizedBox(height: 15),
              _NameWidget(),
              SizedBox(height: 15),
              _TelephoneWidget(),
              SizedBox(height: 15),
              _NickNameWidget(),
              SizedBox(height: 15),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 15,
          child: TextButton(
              onPressed: () {},
              child: const Text(
                'Изм.',
                style: TextStyle(
                    color: Colors.blue,
                  fontSize: 17
                ),
              ),
          ),
        ),
      ],
    );
  }
}

class _NickNameWidget extends StatelessWidget {
  const _NickNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '@_burbonchik',
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[500],
      ),
    );
  }
}

class _TelephoneWidget extends StatelessWidget {
  const _TelephoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '+375442345489',
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[500],
      ),
    );
  }
}

class _NameWidget extends StatelessWidget {
  const _NameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Илья Бурван',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      child: CircleAvatar(
        backgroundImage: AssetImage('images/avatar.jpg'),
      ),
    );
  }
}
