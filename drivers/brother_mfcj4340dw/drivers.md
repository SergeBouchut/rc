Fedora 34

See: https://support.brother.com/g/b/downloadlist.aspx?c=au&lang=en&prod=mfcj4340dw_eu_as&os=127

```bash
sudo rpm -ihv --nodeps mfcj4340dwpdrv-3.5.0-1.i386.rpm
sudo rpm -ihv --nodeps brscan5-1.2.9-0.x86_64.rpm
```

If not working.
Printer > Add printer > ...

If not working.
CUPS http://localhost:631/
Administration > Manage printers
Select printer `MFCJ4340DW`

Modify printer 
Select driver: `MFC-J4340DW - IPP Everywhere`
