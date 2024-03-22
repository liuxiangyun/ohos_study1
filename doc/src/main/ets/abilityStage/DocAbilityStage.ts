import AbilityStage from '@ohos.app.ability.AbilityStage';
import Want from '@ohos.app.ability.Want';

export default class DocAbilityStage extends AbilityStage {
  onAcceptWant(want: Want): string {
    if (want.moduleName === 'doc' && want.abilityName === 'DocEditAbility') {
      return `DocEditAbility_${want.parameters.docName}`
    }

    return ''
  }
}