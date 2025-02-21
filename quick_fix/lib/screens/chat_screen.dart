import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_fix/domain/entities/message.dart';
import 'package:quick_fix/providers/chat_provider.dart';
import 'package:quick_fix/widgets/MyMessageBubble.dart';
import 'package:quick_fix/widgets/YouMessageBubble.dart';
import 'package:quick_fix/widgets/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAMAAzAMBIgACEQEDEQH/xAAcAAACAwEBAQEAAAAAAAAAAAADBgIEBQEHAAj/xABFEAABAwICBQgIAwYEBwEAAAABAAIDBBEFEgYhIjFBEzJRYXGBkaEUI0JSscHR8AczciRDYoKS4RUlU/E0RGOissLyFv/EABoBAAIDAQEAAAAAAAAAAAAAAAAFAQIDBAb/xAApEQACAgEDAwMEAwEAAAAAAAAAAQIDEQQhMQUSQRNRYSMycYEiM0IU/9oADAMBAAIRAxEAPwBQyqbWrrQiNCdC841qmGrrQiAIA41qmGqTQpAKCDgCkGqQCkAoAiGqVlKykApAiAu2U7L6yAB2X1lnYjjUFI/k4fXz+40izf1FZgmrq5/rqnk2O9iEW89/mua3VV188nRXppz38DEQuOasO9PTbTC50jeLZLk9NxdUKPHX+l5Xxubte+dfisFr4tZwavRteRnKg4ItO70lmbk3NX0jMq6atRC37WYWUyr5KrghOCsuCE5q2Miq4ILmq24IL2oJKbwgSBXHhV5Agsim8INlaeECyqy6GRoRA1fNCIAtDE+a1EaF80IjQgg+DVIBfBSCqSfAKQC+CkEAfWXQF0LoQQfWWDj+Kvj/AGSldlefzH9HUOtaeMVzaGhdJ+8dsxjrKVqJl3OqKna2tkb7m/34ri1mo9NdseTs0tPe+58BqCgYGZ5Ob7LeJ69e7tWxDFVPZ+yUkTW+/JqH1P3qRsGo3SeulF3O97cAmuGhgp4uWqW5z7Mbt3Vfh3JFKe41URAqqSpc7M6WN2V21yQuB3rAr4XUeLP2tnU67Re1xfWF6XNRyYnLsU1e32WucGhnYLcEqaV4XK3HMrWuy5Wt3HVqGq/zVq7N9wnW8DHo+OViy5c0gtdl+cDuc0rTrsP5Wn5SLa9rdw+vBV9HaNzKGJj25Xs5vDVxb2cR2pgptpmfgfj/AH+Kzha6590SZVqce1iO5qE4LVxmk9GrnNZzXbTe9Zzmr1Nc1OKkvIhnFxk0ys4ILwrLmoL2q5UqvCryNVx7UCRqCUUpAq9lckaq9lBdDIAiNCi0KbVcxJNCmFwKYUAdAUgFwLoUEnbKQC4FIIA6ApALiHVz+j00s7vYaXeSM4BCppFV+lYqYm/l0+z/ADEfIIdG3l6iKNvNbbx6VlZ3Frnv/MkJLj1k3KYtHKflalrf5fr9F57U2dzcmO6IdqURwwyNsFPFIG3LnWiZ0u6T1DemWgw+Jr2zVHrpPeduHYOCycFYK2oMrD6iHYj7uPebpqjiXAtzuSwi1G1uTK0NWNpPg0WI02cbEw1te02IPaFuQtUalmyrtbFc7iFotir5Z58GxQNFXA3NHLYDO0avELZb6jEXQu/LnbnZ0X4j5pW0up3YVjdHi0WyI5QH/p3OHgSmbENpkFQ32HZm/f3vVGQ0U9KoNinm927XffclhwTpjbWy4S9zObqd/fzSc5eg6bPupx7MTa2OLM+5XcEF4VlwQXhd5xlZ4VeQK24IEgUklOQKuQrcgQC1QWRvhTaotU2qxkTCkFEKYQB0KQUVIKCTqkFELoQBILL0mk5PCZWe/s+Or5rUCX9L5PUU8HF7y49gF/jZZXvFbZpSszSFeLaez+pNeCuNJh09YWOJDNkN33cdXxPgleBu34r0bR2ljMFPHI3U93wFvmV5zUS4H1McmbQ1tZkhdQ0Jp898ro5LF1gfZ3XNtV+nrTroxiVVWSej1Gbl4+fmFjcGxC0IaGnpGco0Btm7OpA0Y5OoxKtqY25Whwa3V0b/ADJWTw8YNkms5JY/iFfQm1I5wvYABmYuPQOtZuG6VwuLRitRXQPfsskkYAxxBIO4G2sWTZPTNnZm3PYbtd0HpWa3R2he10c0LHseblruJ33KlJY3KvOdjE0wphX0Lo3ObIxzdl41IbZ3DRmjnldtNy5v6dfzWtpHFHDRNZG3KxjbNasTEhyWjvJfxRN8VjnfBeS2yatS7/LaiP3Yi3w3JQcE21gywS/od8EqOTvpL/hL8ifqC/kgLghPCO4ITwmwvK7ggyBWHhBeEAVJAq9lakCAQgsjaaphQaphWMyakFFdCAJroUQuqCSQUlAKQQBIJX0pOevpW/w5fG5PyTQEs443NjUX37IXNq3ipnRpVmxGZBF63N99a9Fw39lfR5vdy99h/dI1LFmqIm+863nb5r0J8H+XE+23bb3WB8l5q95aH1WwwVNQ30J36VT0NraZkUjM4zFxzdt1QrcS5ChinjifLGbBwZa41fVSwXEcMuJ/QpmSnjkuD4KqZv2N8IbHTZoc9OS5nSFOCdrmKlDi7ZzydPRTuJ1mzQAO1fW57i0tJ1lo4HirZwVcccoy9J5c7WRN5znBvms7Esr46SP3qtvfla76BTxadn+IxRudcRgyu7tapzS5qrC4jzgH1Du77Kx/0RLg1qs52vb/AAHzDvolchM8jclNK53+mfKN31SyU86T9kvyJ+ofdEEQhuCKQhuTcXAHBBeFYcEB4QBVkCr2VqQKvZBZGsFIKAKmFczJgrt1ELqgCYXQoBSCCSYXQohfBw3XCrlBgIFi4zHlxCGT3m5fH7C2BKz32+Kycac11TRta4GzjuPYuTWNeizq0qfqIBRw/t1L15j4uA+SfZWO/wAPqMmt2R+QHpy5h8ErQQZMRgb7rmt+/BOsUeeCVo17UY8RY+S8zKWZDzGwsaPVPprJaYmz2G4vxaePgmPCcLs+zXPjB4NNgUkYWyWCYTR3B6Om+uyccLxzMxt43AhGUmbxbS2GmKLkWWb39JWDj+MMo2OEW3L1fFWKrFJZmZYhkJ3k8EmaUzinpHNDrPdx3ozl4RX5Zk4NWVOI1NTVTuJdPJyEbRua3eSPJME07f8A9BUH2aOGKHv57vkFl6K04jmhbJstp4+UkHQd58rIVHUeky1E7v8AmZnTO7CbAeHwUy+54M1xuO8zHDBbu5xhJd/SB80sEJoxR3JYJk9qzG+JF/8AxSyU86WvpN/Io17+ol8AiENwRihuTM4QDwgvCsOQXqQKkgQLKzIEAhBJfCmChhSBVzMJdduoAqSgCQXXyNY0F2s8B0qIKFB6/FSz2YtXfvPlZcurv9Gpy8nVpafVsUfBpUGHy1O1K4gdDdyljGBMMDNTm5po2EgkWBeAdfemDDY2tY3UreIwctQvDedYOb23BHwXlpaiyUu5tnoo01xXakjziuwI0VZKHBz42NLmknXYWv361gUsvKVsRO7PxT3pnK5lJG+M2Mxc0njlIv8A+oXncILKkOeLZXj4rornKcXlmFkVFrCPQZosmLA8GzDyATdBszyRt/eU7XN7Wn+6V60cu1kzf3zQR2lo+YK2oqo3o6ngHbX6Xf7k9y43yaY2M+mos1ZLG1vNkcbdRJI8itGPD2w8Ldi0BQtjrZZGnnfY8rKxI+MNs8WcoNlwUnQ5WJG0gHL1zQ7W1pzd28p/meeSdlaknGoZH1TrNsX2H35K0HuRJbFUF1NhFVJez6x3JNPQ0anH5KvhDeWmha0apJg1rf4QMvzJRdIjkmZRxbqeIRD9RsXH4eCv6F0nLYkJ98VI2zb8XH7J7wtPBkM2kBy0bWcTIP8AtFj5kpcK29IHbcTPaDLO7bgn4rFK9F0+PbQhFrHm1kHBDcEU7lBy7TmAOCC8I7kJ6AKsgQCFZkQCgksAqQKGCpArQoEBXQVAFdBQAQFTwGPlayeS37w+Wr5IbCtPRSIPAd7xLvNKOryxUl8jPpkfqN/A00UXNurr2bOV2tfU8ewiTDKxeeSHbYg6btBmpaZu/MT9910nSU4zOfwP38fgmbSGflsead4ja4i/V9lZT6fM+VvS5wb2AnX8FtB9qM5LLNzBJvSMNgp385gLOrfq+n8y1aGRtuRkuN978Ad/glfCJXQzPZezDtC3Rx++pNUDxVjlGgCduojgXcfHWsbOQjsMlK/loW3/ADG6j3Ir4Q7adrWfQymN13sc0jfquFpE31t3KE8muMFTMQ3K4KhW08bnNkDQXMdmaOnqWnUMOS9tazawvZFlYPWO3A8ENkvgTMQp3PrHuHreTOTMPafv+aa8DhiwzCnTy6msuXH3j/8AVh2KBw2OLkYY9dvaO9zr3Lj361m6X4i1kVPhdKSC5zXykcGjcPmrvd4Oc7W1QngbUyhxe6wAbvc421DwKFDBUv8AzGBvQN5AUNHb1rhK4XihByDpLuPc0D+opohpQuirV20rtT2Kz0tdu7QsSMfHsyAt7kNwTpLh0dRE9j2b93SEo1ULqed8TudG6xTzSaxXrDWGhPqdL6LynlFNwQnhHcEF67TjK0gQCrEiCVJJ0FSBQwVIFaFAgKkEO6kCgCebIzN7utbuhbLUzEuzH1Th7wy+OpNujUXJRNSLq8vtiOelx2kxtgbsIddsxO/SUSF2wh1O3G5v8KTeBmuTyatc6SscSfZfr8UeNvqWG20IbntO9VMUd6NjFRC7rNuokrSpsgbNmvsMFlMtkiUssoM9XMwDfkWpgc0kUzGvcQLbzwHA+SpwwPkkZIR7RFlsVFMYqunyN50bvJ3+ypN+CyiOlCWzwsfYWLUYDKcqpYK71fJ8HNzN71bMm3vRHghhQ4O5wCwMSrI7ultqzZWdZWnXziOmdrDSdV+rpStK41VQZJAWwRtsB8O9RJhgJVYm2niJzXle3X0tb9Tr7NSUMQrjM+SodrmkfkjHkPkFeqw4uc4c52sm24FW9H8DdUzirnaWxQi7GkatXH76yrQwt2VcfY1tF6bkKFoG4aj1kavkmWJqXsGeIqDDoi7aFMxz+tzhfX98Uxw7Sq+S/gtxJQ0na0YtLlG9rSnGIJO0mP8Am0v6W/BNemf2/oXdQ/r/AGYzkF6O5Ben4kK0iAVYkCApAGCpAoQKmCtCgS6kChgqQVWycGg3CKuVsE+RroCcxLXgm3Z3pzoqKWKFr3RENPSk7AYMWmkmloKgtZm1Mcy41d6b8PxDGHu5KupYxawDw/UenVbsXltZN2WvPjY9Hpq1XUsedzZibsLrgo00b26y4doRdQ36ly9p0ZPFfxFIg0qfYmxiY421cT9F2nx6BrGctdzXOuctrga+CH+Jbs2lkw4NgYPMpXuu+NMZwWThd0oTeD1jDavCq/0dlHURk5tcbjlcO4/Jbj6TPWQbNy1r14fHKWXAcRfiFrYdpRi2HBraatkDQbZXbQt3rCehz9rNoaz3R7RRs5JjRbWzUEKSpDX7l5vTfiNijPz4KeXrALT5alNmnu1mkoM1+iW3yWb0tiRqtRWx2nbNXyayRG3eOlQqKKV8eSONwY3f1pepvxDw8fm0NQz9Lmu+iut/EbCf9Gr/AKG/VZ/81nsW9ev3NOiwAyPvURhjOAvvWljHJYdgtXydm2p3eTSsFv4lYQzm01Uf5W/VL2lOnH+M0ZoaOlMEU5DXue/M5zb7tQ1LSOnn5Ku+Pub2j+apPLHmuIyDobw8gnGnbzUu4BCRTx2AAy7kyRLDybMtxtSLjsmfFqgg3s4DwsE9ZsjHv4BecySGR5e7W55Lj3m6c9Lh/KUvgVdRl/FIA5CeiuQ3p0KCtIgI8iCQgCpdSBQ7roK1KhgUblqSFjDO+5O4AcetVgUCoHKEsLS5w1Nyi/il/UH9LnG53aDHqcZ2PR9GqOsosMjZNyZc7WQ0Xtda4fwyuv0rP0WknkwOCWeYSkjUB7PUtK684PGTFTK1nMC5y03OkaBfgFGMgbyCih7Jn5W2t1oIPKdNtGMcrMdqsQpaEz0zg0NLHAuADbc3fvvqCR3Ne17mSMcx7TZzXCxHaF+lmQ33LLxzRrCcZYfTqRjpNwlaMrx2O3hdNeocVho5rKFJ5TPz7ZfJ9x78Ma2lzS4POKuPfyMhyyDsO4+SR6ykqaKcQ1lPLTyj2JW2PdfeuuNkJLZnLKuUeUCuvrrm7evtSuUOZ1IErlx0L4FAE2uV3D4uXr6SO2p0g8tfyVELc0Wi5XGaYW1NBcerh81Sx4g2aVLMkj1vB4stO3sWxGqNA3LE2y0GC29J0NWztW7LQy/oPwXno3L0Sdmemkb0g/BedjcE86XxL9CjqPMf2DchPRXITk2FhXkQCjyIBKAM8FSBQgVIFagFBRob5g2GIOe85XPcbi3YqwKPT1L4BZhu29yCFyayl3Vdq5OjS2xqszLgeNEQylwwwSv2g4l1/aJ6Pot1jo3c037F5rgpdLO5s9TPcHMAJCNR7E4UMAdvqZ/6wfiF5q2Drk4S5H8JKxd0eDamAYxxbrPUqtPjFLTC0zXNI3ksJupy4eCz/iag/wA1vhZY9Zo7FNuzi/8AG76rJySLKI2UdZS1kQlp6hkgd0FW5L9S8ybo3XYZIZcIqHxk6jGdbT1FbWE6S1AdyFa0xzjUWPG89StlFe0bHDgqWI4dSYlAYa2njnjPsyNBCJBiEdRrFge1WBI1C90Q17nneL/hlRvzPwuplpnHdHJtsHz80l4noZjdBmLqN0zBufT3f5c5e9bLt4QpKfM3UAe1axvnH5MpUwl8H5sewxvLJGljxva4WPguWX6Cr8Eo61jm1FLFKD77Al2t/DzBphdlO+A/9KQjyvbyW0dWv9LBk9K/B5A1M2goD8TeeIaAt+f8Moz+RXytP8cbXD4BRwfRHF8EqZXtMU7XbnRkgjtB+RUW3QlBpMmqmUZps9BpntY3crsZzrDw2GoH57cvetynaRwXAjuZYfqidftXm3AL0HF5/R8NlkvYhhtfr3Lz8p90tbSf4E/UXvFfkG5CciuQXJqLAEiAUaRAUgf/2Q=='),
          ),
        ),
        title: Text('Chat'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromwho == Fromwho.you)
                    ? Youmessagebubble()
                    : Mymessagebubble(
                        message: message,
                      );
              },
            )),
            //caja de texto
            MessageFieldBox(
              onvalue: (value) => chatProvider.sendMesagge(value),
            ),
          ],
        ),
      ),
    );
  }
}
